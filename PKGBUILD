# Maintainer: James Cherti | Contact: http://www.jamescherti.com/contact

pkgname=linux-keep-modules
pkgver=1.0.1-3
pkgrel=2
pkgdesc="Preserve the Linux kernel modules during and after an upgrade"
url="https://github.com/jamescherti/archlinux-linux-keep-modules"
arch=('any')
license=('MIT')
depends=(bash rsync coreutils)
install="$pkgname.install"
source=(LICENSE
        cleanup-linux-modules.service
        linux-modules-backup.hook
        linux-modules-restore.hook
        pacman-hook-linux-modules.sh)
b2sums=(98d5d25f027f7930b36cc5053db3bb5a963a4b8ce60fb9f645367960394516cae44a9e2b5acaccc390790b1cac172d66ac691b4ebb3ab17f58f0abf19d7a578f
        59b9214635dd0572083c6179dd8490a1f327d0babfe3244a177fd53ecddef27530e363b385f3ac96da424baba45b098cdf8f8db46b33ce4fc92fcfc106e74b69
        64fc2de25de38951e806fdae6e200afb8f4345f3401c33271161db092b1e65b87538d156808e3f35e36e5368f924f7f18e97b231a1c26bfe4e37aa5f0a8b5916
        1acb40ad58847fdfd5536829e374cc54a39f732d94e8023a8033bcbda81546c3ee9bafb1e6a8553b2919e9598cb2f37b1ac879210144201a0240fc0bd5fa47cd
        c2df9002ff02b80d22cfe961cad83bf69046804e1b19111a84cb690b2fce04c0e7d66a0a2d2576b7080fa6457a645899b1551d339f14b6366b44e84a3e4080d0)

package() {
    cd "$srcdir"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "LICENSE"

    install -Dm644 -t "$pkgdir/usr/lib/systemd/system" \
        "cleanup-linux-modules.service"

    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" \
        "linux-modules-backup.hook" \
        "linux-modules-restore.hook"

    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" \
        "pacman-hook-linux-modules.sh"
}
