# Maintainer: Sergi Jimenez <sjr@redhat.com>
pkgname=kcli
pkgver=10.5
pkgrel=1
pkgdesc="kcli is a CLI wrapper around libvirt"
arch=('any')
url="https://github.com/karmab/kcli"
license=('Apache')
depends=('python2'
         'libvirt-python2>=2.0.0'
         'python2-docker>=2.0.0'
         'python2-flask'
         'python2-iptools'
         'python2-netaddr'
         'python2-pyaml'
         'python2-prettytable')
makedepends=('python2-setuptools')
optdepends=('libvirt: locally managed VMs'
            'qemu: libvirt KVM driver'
            'docker: interaction with local docker daemon')
provides=('kcli=10.5')
source=($pkgname-$pkgver.tar.gz::"https://pypi.python.org/packages/76/16/b12f451186fc3b1ee170eef83f4d50ab2a647207b442ce51be6178b77a7b/$pkgname-$pkgver.tar.gz")
md5sums=('c2abc17c371b4d39a9c1a9dd7d06dba7')

package() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/"
}
