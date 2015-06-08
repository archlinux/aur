# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kupfer-plugin-volumescc
pkgver=1
pkgrel=1
pkgdesc="Modified version of default kupfer volumes plugin that allows usage of a custom unmount command"
arch=('any')
url="https://gist.github.com/4351271"
license=('GPL')
depends=('kupfer')

build() {
  cd "$srcdir"
  if [[ -d kupfer-volumes-cc ]];then
    cd kupfer-volumes-cc
    git pull
    cd -
  else
    git clone --depth=1 https://gist.github.com/4351271.git kupfer-volumes-cc
  fi
}

package() {
  install -Dm644 kupfer-volumes-cc/volumes_cc.py "${pkgdir}/usr/share/kupfer/kupfer/plugin/volumes_cc.py"
}

# vim:set ts=2 sw=2 et:
