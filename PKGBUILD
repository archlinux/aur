# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>
# Contributor: Firmy <firmianay@gmail.com>
pkgname=python2-pwntools
pkgver=3.13.0beta0
pkgrel=1
pkgdesc='A CTF framework and exploit development library.'
arch=('any')
url='https://github.com/Gallopsled/pwntools'
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
provides=('python2-pwntools')
conflicts=('python2-pwntools')
options=('strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gallopsled/pwntools/archive/${pkgver}.tar.gz")
sha256sums=('c67aa5545f77e76dee270fa6ac2b7dfe31189aff7ebebb2dc57b786212892d6e')

_repodir="pwntools-${pkgver}"

prepare() {
  cd ${srcdir}/${_repodir}
}

package() {
  cd ${srcdir}/${_repodir}
  python2 setup.py install --root=${pkgdir}/ --optimize=1 --only-use-pwn-command
  install -D -m 644 LICENSE-pwntools.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm ${pkgdir}/usr/lib/python*/site-packages/*.{txt,md}
}
