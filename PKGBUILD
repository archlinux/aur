# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=roundcubemail-plugin-tinymce-config-git
pkgver=3.5.4.r0.ga99d2b61
pkgrel=1
pkgdesc='Roundcube plugin to change paragraph breaks to line breaks in roundcube compose editor'
arch=('any')
url='https://git.kolab.org/'
license=('AGPL3')
makedepends=("git")
depends=('roundcubemail')
source=("${pkgname}::git+https://git.kolab.org/diffusion/RPK/roundcubemail-plugins-kolab.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/roundcubemail.plugins.kolab.//'
}

package() {
  _instdir="${pkgdir}"/usr/share/webapps/roundcubemail/plugins/tinymce_config
  install -dm755 "${_instdir}"
  cd "${srcdir}/${pkgname}/plugins/tinymce_config"
  install -m644 composer.json "${_instdir}"
  install -m644 tinymce_config.php "${_instdir}"
}

