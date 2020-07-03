pkgname=otf-libre-caslon
pkgver=1.002
pkgrel=2
pkgdesc='A free Caslon font designed by Pablo Impallari'
arch=('any')
url='http://www.impallari.com/librecaslon'
license=('custom:OFL')
textbase='https://github.com/impallari/Libre-Caslon-Text/raw/c31e21f7e8cf91f18d90f778ce20e66c68219c74'
displaybase='https://github.com/impallari/Libre-Caslon-Display/raw/3491f6a9cfde2bc15e736463b0bc7d93054d5da1'
source=(
  "$textbase/OFL.txt"
  "$textbase/fonts/OTF/LibreCaslonText-Bold.otf"
  "$textbase/fonts/OTF/LibreCaslonText-Italic.otf"
  "$textbase/fonts/OTF/LibreCaslonText-Regular.otf"
  "$displaybase/fonts/OTF/LibreCaslonDisplay-Regular.otf"
)
noextract=("${source[@]%%::*}") # Don't extract anything
sha256sums=('ba0f5eb8f16cbf7096e413341a236c2b1b11dbb7a90898ecff865fe3d25c44ec'
            'b996ece27366aae000f48671b2cbab2e5a037e17173b7971d1f352d524652438'
            'b8c6261d06cc21ea1e0a7297ee1bc65645ae402459ac9ad550cba677cc5fe72e'
            '948d0f09c527a10b30e47370e46ed7ef2602d372ca96bb0ccc14b5a255d99fe7'
            '48ab940f9c68ea74029a052f71959c2f6a8307c6a4e5575f1a65495e69c2fd3b')

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
