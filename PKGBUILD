# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-cli'
pkgver="1.4.4"
pkgrel=1
pkgdesc='Command line application as an alternative to the ReVanced Manager'
arch=('any')
url="https://github.com/revanced/revanced-cli"
license=('GPL3')
depends=('java-environment' 'revanced-patches')
install='revanced-cli.install'
source=("${pkgname}.sh"
        "${url}/releases/download/v${pkgver}/revanced-cli-${pkgver}-all.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('d163e7791b1010ec330383f68f8fee05b1f69d5aaba86c02de88b88453b4be53'
            'e690497958fdd513543fedb2963386aec0e594d2ee1c722a706fe097f393dba4'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 revanced-cli-${pkgver}-all.jar "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
