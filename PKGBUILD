# Maintainter: Jerome M. Berger <jeberger@free.fr>
pkgname=pacmerge
pkgver=0.1.2
pkgrel=2
pkgdesc="A semi-automatic merge tool for pacnew files."
arch=('x86_64' 'armv7h')
depends=(expac diffutils)
makedepends=(cargo)
source=("$pkgname::hg+https://heptapod.host/jmb/pacmerge#tag=v${pkgver}")
md5sums=(SKIP)

build() {
    cd "$pkgname"

    cargo build --release --locked
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/pacmerge" "$pkgdir/usr/bin/pacmerge"
    install -Dm644 "pacmerge.hook" "$pkgdir/usr/share/libalpm/hooks/pacmerge.hook"
}
