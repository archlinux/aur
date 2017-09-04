# Maintainer: Morten Linderud <morten@linderud.pw>  
pkgname="molecule"
pkgver=2.0.2
pkgrel=1
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
sha256sums=('9cf3532ed4c5c262c2b4acd90da41c0c4cdf86ca15519f6dc3924b32d660ea5a')

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
