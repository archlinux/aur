# Contributor: Roman Zimbelmann <romanz@lavabit.com>
# Contributor: nfnty <arch at nfnty dot se>
# Contributor: aksr <aksr at t-com dot me>
# Mantainer: Sourav <thefallnn@gmail.com>

pkgname=ranger-alacritty
pkgver=1.9.3.549.g3bc9b4bf
pkgrel=1
pkgdesc="A simple, vim-like file manager."
arch=('any')
url="https://ranger.github.io/"
license=('GPL')
depends=('python') #python(>=2.6 or >=3.1)
makedepends=('git' 'python-setuptools')
optdepends=('atool: for previews of archives'
            'file: for determining file types'
            'highlight: for syntax highlighting of code'
            'libcaca: for ASCII-art image previews'
            'mediainfo: for viewing information about media files'
            'perl-image-exiftool: for viewing information about media files'
            'poppler: for pdf previews'
            'python-bidi: for bidi algorithm support'
            'python-chardet: in case of encoding detection problems'
	    'python-pillow: image preview with kitty'
            'python-ueberzug: w3mimgdisplay alternative'
            'sudo: to use the "run as root"-feature'
            'transmission-cli: for viewing bittorrent information'
            'w3m: for previews of images and html pages')
provides=('ranger')
conflicts=('ranger')
source=("$pkgname::git+https://github.com/thefallnn/ranger-alacritty")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py -q install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE

  
}

