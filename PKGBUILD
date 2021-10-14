# Maintainer: Charles Vejnar

pkgname=rsync-readcap
pkgver=0.1
pkgrel=1
pkgdesc="Create copy of rsync with read-everywhere capability under rsyncr user. For pull backups."
arch=("any")
url="https://github.com"
depends=("rsync")
install="rsync-readcap.install"
source=("rsync-readcap.hook"
        "rsync-readcap.sysusers")
sha1sums=("238745a396d395e55c9423742a568d03abae7e59"
          "95e5725e3fdaa0d80a8b7114031f12d14289fffa")

package() {
    cd "$srcdir"

    install -dm 700 "${pkgdir}/var/lib/${pkgname}"
    install -Dm 700 /usr/bin/rsync "$pkgdir/var/lib/${pkgname}/"

    install -Dm 644 ${pkgname}.hook "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
    install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
