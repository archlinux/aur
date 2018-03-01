# Maintainer: Sergi Jimenez <sjr@redhat.com>
pkgname=kcli
pkgver=10.6
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
provides=("kcli=${pkgver}")
source=($pkgname-$pkgver.tar.gz::"https://github.com/karmab/kcli/archive/v${pkgver}.tar.gz")
md5sums=('5ff1b01e3f6eec98f441b821b3aba685')

package() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/"
}
