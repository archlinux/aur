# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=3.4.0
pkgrel=1
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://bitbucket.org/sejdapdf/sejda-desktop-public/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('9567dbb08152966ea12e0ed1a330abcf5a202c756d7288cc774267c4340b3d91abee4640c92b9886cf5b238239dc20c8625e1c5865da8476d1ea7ac02854d2ff')
options=(!strip)

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/sejda-desktop/sejda-desktop "${pkgdir}/usr/bin/sejda-desktop"

  # fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # symlink licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for _i in EULA.pdf LICENSE.electron LICENSES.chromium.html; do
    ln -s /opt/sejda-desktop/${_i} "${pkgdir}/usr/share/licenses/${pkgname}/${_i}"
  done
}


sha512sums=('e3d73dc3cc633cd44d42f3c827c0cf83818e9e7e186c38f471fcf9a028c514bba9f9b0c7398e1cee1f5d1b8c0af9ce3285d8973513c09d33ce2880881530777b')
