# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams-insiders
pkgver=1.2.00.32451
pkgrel=1
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365 - Insiders Version"
arch=('x86_64')
url="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("gnome-keyring")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('ab02f9694b51956d289b16754d5b687184bd3817fa7626082c27a4f6f5f8c73d')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
