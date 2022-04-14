# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams-insiders
pkgver=1.5.00.10453
pkgrel=1
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365 - Insiders Version"
arch=('x86_64')
url="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("org.freedesktop.secrets")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('601d1bf8c56c632da0ab2b98d03ec50593f4f5605a4ec8cefedb613a4ca09c1543923258535a7b0af88d5150f87934d46c4c7769ccf488b50f80d75b46781850')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
