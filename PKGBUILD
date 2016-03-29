pkgname=moderngpu
pkgver=2.0
pkgrel=1
pkgdesc="Design patterns for GPU computing"
arch=('any')
url="http://nvlabs.github.io/moderngpu"
license=('BSD')
depends=('cuda')
makedepends=()
_name="${pkgver}_mar_28_2016"
_dir="${pkgname}-${_name}"
source=("https://github.com/NVlabs/${pkgname}/archive/v${_name}.tar.gz")
sha256sums=('a6d56b3b98706f92ea46cdd5e7595bd00a7deb4a2f09d558cc27c3ab664f492b')

package() {
  cd "${srcdir}/${_dir}"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  cp src/moderngpu/* "${pkgdir}/usr/include/${pkgname}/"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r {tutorial,demo} "${pkgdir}/usr/share/${pkgname}"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ft=sh syn=sh et
