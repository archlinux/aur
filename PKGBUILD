# Maintainer: AlphaJack <alphajack at tuta dot io>

_pkgbase="piper-voices"
pkgname="$_pkgbase-common"
pkgver=1.0.0
pkgrel=3
pkgdesc="Voices for Piper text to speech system (common files)"
url="https://huggingface.co/rhasspy/$_pkgbase"
license=("MIT")
arch=("any")
depends=("piper-tts" "alsa-utils")
optdepends=(
 "speech-dispatcher: tts support for third party apps"
 "$_pkgbase-minimal: single voice for en-us"
 "$_pkgbase: voices for all languages")
source=(
 "https://huggingface.co/rhasspy/$_pkgbase/resolve/main/voices.json"
 "piper-generic.conf"
 "piper-dispatcher"
)
b2sums=('SKIP'
        '8f0578959ec6c859f807b255e89baec595016553b4ca7e9ec91faf012a9c8d99ada5613eb6e4f3e01a97f7eb938bcaae23f0636bab7bd854087e865258a94029'
        '2b5129e2e2fd4cb48602bf5d18052b124b31886cf02268de83d7b687f7e681ab83dc8baeb683c905664d26f4ddab6f86d95fbe3849113c26e5be5c557642810f')
options=("!strip")
install="$pkgname.install"

package(){
 install -D -m 664 "$srcdir/voices.json" -t "$pkgdir/usr/share/$_pkgbase"
 install -D -m 664 "$srcdir/piper-generic.conf" -t "$pkgdir/etc/speech-dispatcher/modules"
 install -D -m 775 "$srcdir/piper-dispatcher" -t "$pkgdir/usr/bin"
}
