pkgname=dpluzz
pkgver=1.5.2
pkgrel=1
pkgdesc="Software to retrieve videos from French website pluzz"
arch=('any')
url="http://forum.ubuntu-fr.org/viewtopic.php?id=1559861&p=1"
license=('GPL')
groups=()
depends=('python2' 'pygtk' 'vte' 'mplayer' 'python2-beautifulsoup3' 'python2-beautifulsoup4' 'uni2ascii' 'ffmpeg' 'python2-lxml')
optdepends=()
conflicts=()
source=("https://launchpad.net/~yoggic/+archive/dpluzz/+files/dpluzz_$pkgver%7Eubuntu14.04_amd64.deb")
md5sums=('39f66cee4881db41c12860500bd3ebd8')

build(){
   cd "${srcdir}"
   tar xvfJ data.tar.xz
   cd ${srcdir}/usr/share/dPluzz
   sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' dPluzz.py
   cd ${srcdir}/usr/share/applications
   sed -i 's|Exec=python /usr/share/dPluzz/dPluzz.py|Exec=dpluzz|' dpluzz.desktop
}

package(){
   cd "${srcdir}"
   mv usr/ ${pkgdir}/
}

md5sums=('48181567a398d9124f18bf3a079f95ca')
