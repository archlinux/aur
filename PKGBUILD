# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=python2-pwntools
pkgver=3.7.0
pkgrel=1
pkgdesc='The CTF framework used by Gallopsled in every CTF'
arch=('any')
url='https://pwntools.com/'
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc'
             'python2-setuptools')
depends=('python2>=2.7'
         'python2-mako'
         'python2-paramiko'
         'python2-pyelftools'
         'python2-capstone'
         'python2-pyserial'
         'python2-requests'
         'python2-psutil'
         'python2-tox'
         'python2-pysocks'
         'python2-dateutil'
         'python2-pygments'
         'python2-pypandoc'
         'python2-packaging'
         'python2-unicorn'
         'python2-intervaltree'
         'python2-pip'
         'ropgadget')
conflicts=('python2-pwntools' 'python2-pwntools-git')
options=('strip')
source=("https://github.com/Gallopsled/pwntools/archive/${pkgver}.tar.gz")
sha256sums=('ebbe14a334de1d8f9c3ac7500d35f81a06b1d7d8d920ce79647340f159959f6d')

_repodir="pwntools-${pkgver}"

prepare() {
  cd ${srcdir}/${_repodir}
}

package() {
  cd ${srcdir}/${_repodir}
  python2 setup.py install --root=${pkgdir}/ --optimize=1 --only-use-pwn-command
  install -D -m 644 LICENSE-pwntools.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm ${pkgdir}/usr/lib/python*/site-packages/LICENSE-pwntools.txt ${pkgdir}/usr/lib/python*/site-packages/requirements.txt
}
