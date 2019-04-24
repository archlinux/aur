# Maintainer: gee

pkgname=ialauncher-git
pkgver=1
pkgrel=2
pkgdesc='Play all of the Internet Archive’s MS-DOS games offline!'
arch=('x86_64')
url='https://github.com/rtts/ialauncher'
license=('GPL3')
depends=('dosbox' 'webkit2gtk' 'python' 'python-natsort' 'gst-plugins-bad'
         'python-jinja')
source=('ialauncher::git+https://github.com/rtts/ialauncher.git'
        'gamespath.patch')
sha256sums=('SKIP'
            '3d1fc7b7ad96bcbeb2f3a8331df7c157c9720c4f3c685715cba0aa1a98a2c166')

# no tags yet
#pkgver() {
#  cd ialauncher

#  git describe | sed 's/-/.r/; s/-g/./'
#}

#prepare() {
#  cd ialauncher

#  patch -Np1 -i "${srcdir}/gamespath.patch"
#}

build() {
  cd ialauncher

  python setup.py build
}

package() {
  cd ialauncher

  python setup.py install --root="$pkgdir"
  #install -dm 755  "${pkgdir}/opt/ialauncher/"
  #cp -r games "${pkgdir}/opt/ialauncher/"
}
