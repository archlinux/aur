# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=('zarafa-spamassassin')
groups=('zarafa'
	'kopano')
pkgver=0.1
pkgrel=1
pkgdesc="Spamassassin for Zarafa"
arch=('armv7h'
      'armv6h'
      'x86_64'
      'i686')
url="https://documentation.zarafa.com/zcp_python_zarafa/"
license=('AGPL3')
depends=('zarafa-server'
	 'spamassassin')
makedepends=('git')
source=("${pkgname}::git+https://github.com/zarafagroupware/python-zarafa.git")
md5sums=('SKIP')

prepare() {
    return 0
}

build() {
    cd ${srcdir}/${pkgname}
    return 0
}

function cfg_set() {
    # 1: field / 2: value / 3: file
    # Replaces optional comments and spaces
    # "# name = value" => "name = newvalue"
    #
    sed -i "s|^#*\s*\($1\)\s*\=.*|\1 = $2|" $3
}

package() {
    cd ${srcdir}/${pkgname}
    return 0
}
