# Contributor: Roman Zimbelmann <romanz@lavabit.com>
# Contributor: nfnty <arch at nfnty dot se>
# Maintainer: aksr <aksr at t-com dot me>
_pkgname=ranger
pkgname=ranger-git
pkgver=1.6.1.105.g1538e80
pkgrel=1
pkgdesc="A simple, vim-like file manager."
arch=('any')
url="http://savannah.nongnu.org/projects/ranger"
license=('GPL')
depends=('python')
makedepends=('git')
optdepends=('atool: for previews of archives'
            'file: for determining file types'
            'highlight: for syntax highlighting of code'
            'libcaca: for ASCII-art image previews'
            'mediainfo: for viewing information about media files'
            'perl-image-exiftool: for viewing information about media files'
            'poppler: for pdf previews'
            'python-chardet: in case of encoding detection problems'
            'sudo: to use the "run as root"-feature'
            'transmission-cli: for viewing bittorrent information'
            'w3m: for previews of images and html pages')
provides=('ranger')
conflicts=('ranger')
source=("$_pkgname::git+git://git.sv.gnu.org/ranger.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py -q install --root="$pkgdir" --optimize=1
}

