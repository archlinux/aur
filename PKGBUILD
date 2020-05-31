# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=sora
pkgbase=${_project}-font
pkgname=("ttf-$_project" "otf-$_project" "ttf-$_project-variable")
pkgver=1.002
_sha=50fd1ab47afb5cabda0028acd491307e839d42b6
pkgrel=1
pkgdesc='Font for SORA'
arch=('any')
url="https://github.com/sora-xor/$pkgbase"
license=('OFL')
source=("$url/archive/$_sha/$pkgname-$pkgver.zip")
sha256sums=('d29da30f5edb8fd26315c8b55713b84fc9da501e78db5369792dc6a6840ffc1c')

package_otf-sora () {
    pkgdesc+=" (OpenType)"
    provides=("$pkgbase")
    cd "$pkgbase-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/otf/*.otf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-sora () {
    pkgdesc+=" (TrueType)"
    provides=("$pkgbase")
    cd "$pkgbase-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/ttf/*.ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-sora-variable () {
    pkgdesc+=" (Variable)"
    cd "$pkgbase-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/variable/*.ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
