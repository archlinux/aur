# Contributor: Lex Childs <lex.childs@gmail.com>
# Maintainer: Lex Childs <lex.childs (at) gmail (dot) com>

pkgname=light-read-git
pkgver=20171126
pkgrel=1
pkgdesc="Simple tool to read allowed (text to speech - TTS) the clipboard and selected text"
arch=('x86_64' 'i686')
url="http://github.com/lex148/LightRead"
license=('MIT')
depends=('xsel' 'xclip' 'festival' 'alsa-utils')
makedepends=('go>=1.3.0' 'git')
source=("git+https://github.com/lex148/LightRead.git")
md5sums=("SKIP")
_gourl=github.com/lex148/LightRead

build() {
  cd "$srcdir"
  # Build using go
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

package() {
  # Package executables
  if [ -e "$srcdir/bin/LightRead" ]; then
    install -Dm755 "$srcdir/bin/LightRead" \
      "$pkgdir/usr/bin/LightRead"
  fi
}

