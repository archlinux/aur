# Maintainer: Mikołaj Milej <mikolajmm+aur@gmail.com>

pkgname=hgflow
pkgver=0.9.8
pkgrel=1
pkgdesc="Git flow branching model for mercurial"
arch=('any')
url="https://bitbucket.org/yujiewu/hgflow"
license=('GPL2')
install="${pkgname}.install"
depends=('mercurial')
makedepends=('mercurial')
source=("https://bitbucket.org/yujiewu/hgflow/downloads/hgflow-v${pkgver}.tar.bz2"
        "${pkgname}.install")
sha512sums=('9f52b39ecc083f93a9f9d81b58e1e1d7db37dfe2c8a02147d3c34fab2ce6ce4a8519692d715f28797ac964743842bfe9c0ebb05bbc4a58c3327329f431090870'
            '1ec8f7f086115f1fb295694ee39bfacda112da01024130420c31989f94d16e95a49f6b849e09ef639dfe0987bc223fc234187dcd4857532db082bfa5a830f7ef')

package() {
    cd $srcdir

    python_packages_dir=`python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

    install -Dm644 ${pkgname}.py $pkgdir$python_packages_dir/hgext/${pkgname}.py
}
