# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=hg-prompt-hg
pkgver=r122.1cb3af183d2f
pkgrel=1
pkgdesc='An "hg prompt" command for viewing Mercurial repository information.'
arch=('any')
url='http://sjl.bitbucket.org/hg-prompt/'
license=('unknown')
depends=('mercurial>=0.9.3')
provides=('hg-prompt')
source=("$pkgname::hg+http://bitbucket.org/sjl/hg-prompt")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s' "$(hg identify -n)" "$(hg identify -i)"
}

package() {
    cd "$srcdir/$pkgname"
    install -m0644 -D prompt.py $pkgdir$(python2 -c 'import hgext; print hgext.__path__[0]')/prompt.py
}
