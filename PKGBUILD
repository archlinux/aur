# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams-insiders
pkgver=1.2.00.33752
pkgrel=2
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365 - Insiders Version"
arch=('x86_64')
url="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("org.freedesktop.secrets")
conflicts=("teams")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('9ce9f9a64b23ca3fc4d96d44dbc7d0332686022231c76b30b3c0c93d9b646321')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
