# Maintainer: Kai Korla <balticer@balticer.de>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Ernie Brodeur <ebrodeur@ujami.net>

pkgname=gitflow
pkgver=0.4.1
pkgrel=4
pkgdesc='Extend git with the Gitflow branching model.'
arch=('any')
url='https://github.com/nvie/gitflow'
license=('BSD')
depends=('git' 'shflags')
source=("https://github.com/nvie/gitflow/archive/${pkgver}.zip")
md5sums=('125f0732c11a6a07d2f90a6792c4afdc')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  sed -i "s:\$GITFLOW_DIR/gitflow-shFlags:/usr/share/lib/shflags/shflags.sh:" git-flow
  install -d -m 0755 $pkgdir/usr/bin
  install -m 0755 git-flow $pkgdir/usr/bin
  install -m 0644 git-flow-feature git-flow-hotfix git-flow-release git-flow-support git-flow-version git-flow-init gitflow-common $pkgdir/usr/bin
}
