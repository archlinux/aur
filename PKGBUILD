# Maintainer: Mikołaj Milej <mikolajmm+aur@gmail.com>

pkgname=hgflow
pkgver=0.9.8.1
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
sha512sums=('a3aacd58dc0682404ffb328698b5f18f9070e987df554b53d7bb406a001324ed1c60c7d03d7559cd12e15f278574579cd7c511a5c8a71b35da0c0e77a7f8059a'
            '1ec8f7f086115f1fb295694ee39bfacda112da01024130420c31989f94d16e95a49f6b849e09ef639dfe0987bc223fc234187dcd4857532db082bfa5a830f7ef')

package() {
    cd $srcdir

    python_packages_dir=`python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

    install -Dm644 ${pkgname}.py $pkgdir$python_packages_dir/hgext/${pkgname}.py
}
