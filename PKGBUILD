# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname="revanced-patches"
pkgver=4.11.0
pkgrel=1
pkgdesc="Official patches maintained by ReVanced"
arch=('any')
url="https://github.com/revanced/${pkgname}"
license=('GPL-3.0-or-later')
depends=('java-environment>=17')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
        "${url}/raw/v${pkgver}/"{"README.md","LICENSE"})
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('783177c6e9c7ca45d5afdcd0a07290f966172eca0bc17523c50ad7a9b6271aa9'
            '6b1d2bac3b03eda03c91b56a080bab91a1af0d9d2ab6248f5579142fbe5df80e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/revanced/${pkgname}.jar"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
