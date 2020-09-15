# Contributor: Sholum <wallyssonryu@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='manim'
pkgver=0.1.10
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=('any')
url="https://github.com/ManimCommunity/manim"
license=('MIT' 'custom:3Blue1Brown LLC')
depends=('cairo' 
         'ffmpeg' 
         'sox'
	 'python-argparse'
	 'python-colour'
	 'python-numpy'
	 'python-pillow'
	 'python-progressbar'
	 'python-scipy'
	 'python-tqdm'
#opencv-python==3.4.2.17
	 'python-cairocffi'
	 'python-pydub'
	 'python-pbr'
	)
makedepends=('git')
optdepends=('texlive-bin: latex support'
            'texlive-core: latex support'
            'texlive-latexextra: latex support'
            'texlive-bibtexextra: latex support'
            'tllocalmgr-git: latex support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('deac2d6d610d812a6f3ccd1faa71ed664e0b38a2609e21cc69743d7486b4ee30')

package() {
  cd "${pkgname}-$pkgver"
	
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  python ./setup.py install --root="${pkgdir}" --optimize=1
}
