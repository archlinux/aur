# Maintainer: Morten Linderud <morten@linderud.pw>  
pkgname="molecule"
pkgver=2.0.0.rc12
pkgrel=5
pkgdesc='Molecule aids in the development and testing of Ansible roles.'
url='https://github.com/metacloud/molecule/tree/2.0.0.rc12'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('ansible-lint' 'python-ansible' 'python-colorama' 'flake8'
         'python-jinja' 'python-marshmallow' 'python-gilt' 'python'
         'python-tabulate' 'python-pbr' 'python-pexpect' 'python-cookiecutter'
         'python-yaml' 'python-sh' 'python-click' 'yamllint' 'python-anyconfig')
optdepends=('python-docker: docker driver'
            'python-boto: EC2 driver'
            'python-vagrant: vagrant driver'
            'python-shade: openstack driver')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metacloud/molecule/archive/${pkgver}.tar.gz")
sha256sums=('f27894ac47e37cf54be159a45e84b6adfae4127ec77e9c46a9c4bfeb5fc8ee24')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
