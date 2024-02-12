# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=kwin-scripts-mudeer
_name=Mudeer
pkgver=4.0
pkgrel=1
pkgdesc="Screen Splitting Shortcuts ideal for Ultrawide and Super-Ultrawide Monitors"
arch=('any')
url="https://github.com/darkstego/Mudeer"
license=('MIT')
depends=('plasma-workspace')
source=(
    "${_name}-${pkgver}.tar.gz::https://github.com/darkstego/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
    "fix-plasma6.patch::https://github.com/darkstego/Mudeer/commit/f26a92a0a035e4ac806e00c62d13c3c8f4ba0a6b.patch"
)
b2sums=('ec98ef12c216436ae3cf8f8c248d637810801a01dc11a694deba77bb76f9d84b088ba82d50909b0242147830c10486eecd2f035dd4a4a99e80f1619157fb8a75'
        '94f61a6706e0d57355577b7d07df4c46e5df3e0b66e291a93f6d36bb79c30e4e408c3ec81cec177cc7a4c772bd5b6cf05095ada0a00ec1d40c00bba1c7a53c30')

# Uncomment to use with Plasma 6 from [kde-unstable]
#prepare(){
#    patch --directory="$_name-$pkgver" --forward --strip=1 --input="${srcdir}/fix-plasma6.patch"
#}

package() {
    cd ${_name}-${pkgver}
    mkdir -p "${pkgdir}/usr/share/kwin/scripts/mudeer"
    cp -r package/* "${pkgdir}/usr/share/kwin/scripts/mudeer/"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
