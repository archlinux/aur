# Maintainer:

_model="2stems"

_pkgname="spleeter-data"
pkgname="$_pkgname"
pkgver=1.4.0
pkgrel=1
pkgdesc="Deezer music source separation library - pretrained model - $_model"
# https://research.deezer.com/projects/spleeter.html
url="https://github.com/deezer/spleeter"
arch=('any')
license=('MIT')

depends=()
makedepends=()

provides=("$_pkgname")
conflicts=(${provides[@]})

options=("!strip")

case $_model in
  '4stems')
    # 140
    source=("$url/releases/download/v$pkgver/$_model.tar.gz")
    sha256sums=('3adb4a50ad4eb18c7c4d65fcf4cf2367a07d48408a5eb7d03cd20067429dfaa8')
    ;;
  '5stems')
    # 174
    source=("$url/releases/download/v$pkgver/$_model.tar.gz")
    sha256sums=('25a1e87eb5f75cc72a4d2d5467a0a50ac75f05611f877c278793742513cc7218')
    ;;
  '2stems-finetune')
    # 206
    source=("$url/releases/download/v$pkgver/$_model.tar.gz")
    sha256sums=('SKIP')
    ;;
  '4stems-finetune')

    # 409
    source=("$url/releases/download/v$pkgver/$_model.tar.gz")
    sha256sums=('SKIP')
    ;;
  '5stems-finetune')
    # 512
    source=("$url/releases/download/v$pkgver/$_model.tar.gz")
    sha256sums=('SKIP')
    ;;

  '2stems'|*)
    # 69.7
    source=("$url/releases/download/v$pkgver/$_model.tar.gz")
    sha256sums=('f3a90b39dd2874269e8b05a48a86745df897b848c61f3958efc80a39152bd692')
    ;;
esac

install="$_pkgname.install"

source+=(
  "https://raw.githubusercontent.com/deezer/spleeter/master/LICENSE"
)
sha256sums+=(
  'b15e40c921ec6fe997e0d88ddab9c26fb915bebbbb9496530d3f98f317d4325a'
)

package() {
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm0644 model.* -t "$pkgdir/opt/$_pkgname/$_model"
  install -vDm0644 checkpoint -t "$pkgdir/opt/$_pkgname/$_model"
}
