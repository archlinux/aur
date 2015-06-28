# Maintainer: Vincent Demeester (vincent@sbr.pm)
# Contributor: Nicolas Pouillard (http://nicolaspouillard.fr)
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Andreas Hilboll <andreas@hilboll.de>
# Contributor: kljohann@gmail.com
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=myrepos
pkgver=1.20150503
pkgrel=1
pkgdesc="Multiple Repository management tool"
arch=('any')
depends=('perl')
makedepends=('git')
optdepends=('bzr: support for bzr repositories'
            'cvs: support for cvs repositories'
            'darcs: support for darcs repositories'
            'git-annex: support for git-annex clones'
            'gitk: support for visualizing git repository history'
            'git: support for git repositories'
            'mercurial: support for mercurial repositories'
            'perl-html-parser: support for webcheckout'
            'perl-libwww: support for webcheckout'
            'perl-uri: support for webcheckout heuristically guessing partial URLs'
            'repo: support for repo repositories'
            'svn: support for subversion repositories'
            'unison: support for unison as a vcs'
            'vcsh: support for vcsh')
url="http://myrepos.branchable.com"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/joeyh/$pkgname/tar.gz/$pkgver)
sha256sums=('6e61e2a0b298841cbc2ea0106fae7c628a5b34e705aafa7536848c60eb448e89')
provides=('mr' 'myrepos' 'webcheckout')
conflicts=('mr' 'webcheckout')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Testing...'
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
