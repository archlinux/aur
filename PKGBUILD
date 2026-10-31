# Maintainer: 4ng3l1c 4ng3l1c@proton.me
# Contributor: 46620 <46620osu@gmail.com>
pkgname='revanced-cli-bin'
pkgver=6.0.0
pkgrel=2
pkgdesc='Command line application as an alternative to the ReVanced Manager'
arch=('any')
url="https://github.com/revanced/revanced-cli"
license=('GPL-3.0-or-later')
depends=('java-runtime-headless>=11')
optdepends=(
	'revanced-integrations: Add support for some integrations' 
	'android-tools: if you want to install the patched APK file on your device (so probably yes)'
)
provides=('revanced-cli')
conflicts=('revanced-cli')
install='revanced-cli.install'
source=("revanced-cli.jar::${url}/releases/download/v${pkgver}/revanced-cli-${pkgver}-all.jar"
        "${url}/raw/v${pkgver}/LICENSE"
        "${pkgname}.sh")
sha256sums=('c25549bc17d59d2eb94fa5f86e60e9b77a02772ca88f7050f8f1276f923a9958'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '54fee6650e017f950dc16a3835c62350bb2679e866d7594d5decff122aeeb7c3')

package() {
  install -Dm 755 "$srcdir/${pkgname}.sh" "${pkgdir}/usr/bin/revanced-cli"
  install -Dm 644 "$srcdir/revanced-cli.jar" "${pkgdir}/usr/share/revanced/revanced-cli.jar"
  install -Dm 644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



