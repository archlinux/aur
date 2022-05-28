# Maintainer: ForumPlayer <fp+aur@forumplayer.dev>
# Contributor: Kyle MacLeod <aur.kmac5@recursor.net>

# Note:
# This PKGBUILD was partially copied from "mopidy-youtube-git" package (Also on AUR)
# So also thanks to Julian Daube, and Adam Goldsmith

pkgname=mopidy-ytmusic-git
_pkgname=mopidy-ytmusic
pkgver=v0.3.5.r2.gcc5e147
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube Music"

arch=('any')
url="https://github.com/OzymandiasTheGreat/mopidy-ytmusic"
license=('APACHE')
depends=(
  'mopidy'
  'python-certifi'
  'python-charset-normalizer'
  'python-idna'
  'python-importlib-metadata'
  'python-pykka'
  'python-pytube'
  'python-setuptools'
  'python-requests'
  'python-tornado'
  'python-urllib3'
  'python-zipp'
  'python-ytmusicapi')
makedepends=('python' 'git')

source=("$_pkgname::git+$url.git")

conflicts=("mopidy-ytmusic")

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('SKIP')
