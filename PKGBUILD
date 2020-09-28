# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_binary_name='com.github.gijsgoudzwaard.image-optimizer'
_pkgname="${_binary_name##*.}"
pkgname="${_pkgname}-bin"
pkgver=0.1.17
pkgrel=1
_pkg_hash='64559e' # <-- NB: update on new version
pkgdesc='Simple lossless image compression'
arch=('x86_64')
url='https://github.com/gijsgoudzwaard/image-optimizer'
_pool_url='http://packages.elementary.io/appcenter/pool/main'
license=('MIT')
depends=('granite' 'jpegoptim' 'optipng')
provides=("${_pkgname}")
source=("${_pool_url}/${_binary_name::1}/${_binary_name}/${_binary_name}${pkgver}-${_pkg_hash}.deb"
        "${pkgname}-${pkgver}-LICENSE::${url}/raw/${pkgver}/LICENSE")
sha256sums=('c2eefbaaf5f9392e6d01e240da27b21a4533165d26cf47a66399a5f3c6e84115'
            '6477678e949d04b38104a51115dc9f2978cb34c7c98aa56865babf8b50277c21')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
