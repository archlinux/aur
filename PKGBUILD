# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-cli'
epoch=1
pkgver="2.22.0"
pkgrel=1
pkgdesc='Command line application as an alternative to the ReVanced Manager'
arch=('any')
url="https://github.com/revanced/revanced-cli"
license=('GPL3')
depends=('java-environment>=17' 'revanced-patches')
optdepends=('revanced-integrations: Add support for some integrations')
install='revanced-cli.install'
source=("${url}/releases/download/v${pkgver}/revanced-cli-${pkgver}-all.jar"
        "${url}/raw/v${pkgver}/LICENSE"
        "${pkgname}.sh")
sha256sums=('8f26aa9192fb68e7395978e5a26653872682530294ec0c8a2ab82d29a754a39b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '966cb49d9de2c2081b1bc5af00babe3a8c7735320f248ff1a8c1c8c7cc775502')

package() {
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 revanced-cli-${pkgver}-all.jar "${pkgdir}/usr/share/revanced/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
