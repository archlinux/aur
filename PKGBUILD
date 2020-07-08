# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scipoptsuite-bin
pkgver=7.0.1
pkgrel=1
pkgdesc='Toolbox for generating and solving optimization problems'
arch=('x86_64')
url='https://scip.zib.de'
license=('LGPL3' 'custom:ZIB Academic License')
replaces=('ziboptsuite')
depends=('gmp' 'tbb' 'zlib' 'gmp')
optdepends=('coin-or-ipopt: COIN-OR Interior Point Optimizer IPOPT'
            'gsl: GNU Scientific Library'
            'cliquer: C routines for finding cliques in an arbitrary weighted graph'
            'hmetis: A set of programs for partitioning hypergraphs'
            'criterion: A cross-platform C and C++ unit testing framework')
makedepends=('tar')
provides=('scipoptsuite'
          'scip=7.0.1'
          'soplex=5.0.1'
          'zimpl=3.4.0'
          'gcg=3.0.3'
          'gmp=6.1.2'
          'papilo=1.0.1')
options=('strip')
source=("local:///SCIPOptSuite-${pkgver}-Linux.deb"
        'LICENSE')
sha256sums=('5effc9cdfdbaee25e4130bb39950db75be40d9fbf32834b5bd2c07b267d386fc'
            'SKIP')

package() {
  tar xvf data.tar.gz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: