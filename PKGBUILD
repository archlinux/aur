# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Contributor: Matjaž Mozetič (https://github.com/sysadminmatmoz)
# Contributor: Vincent Demeester (vincent@sbr.pm)
# Contributor: Nicolas Pouillard (http://nicolaspouillard.fr)
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Andreas Hilboll <andreas@hilboll.de>
# Contributor: kljohann@gmail.com
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=myrepos
pkgver=1.20170129
pkgrel=2
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
url='http://myrepos.branchable.com'
license=('GPL2')
source=("https://git.joeyh.name/index.cgi/myrepos.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('da00533b01a511ece209f0254a6fae5735852e197d3b859a6f564b3fbc612dda')
provides=('mr' 'myrepos' 'webcheckout')
conflicts=('mr' 'webcheckout')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
