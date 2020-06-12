# Maintainer: mads256h <mads256h(at)gmail(dot)com>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: mod24 <bruenker(at)sintro(dot)de>

pkgname=airtame-application
pkgver=4.0.1
pkgrel=1
pkgdesc="Airtame official screen streaming application."
arch=('x86_64')
url="https://airtame.com"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
source=("https://downloads.airtame.com/app/latest/linux/Airtame-${pkgver}.deb")
sha1sums=('1ef1c7f7cc330fba51856790b34ae9ca2dbd3506')
package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Install licenses
  install -m 644 -D ${pkgdir}/opt/Airtame/LICENSE.electron.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt
  install -m 644 -D ${pkgdir}/opt/Airtame/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html

  # Make airtame-application available in /usr/bin/
  mkdir ${pkgdir}/usr/bin
  ln -s /opt/Airtame/airtame-application ${pkgdir}/usr/bin/airtame-application
}
