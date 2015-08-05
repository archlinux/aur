# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=nntpchan-git
_pkgname=nntpchan
pkgver=20150804
pkgrel=1
pkgdesc="Decentralized imageboard that uses nntp to synchronize content between many different servers. It utilizes cryptographicly signed posts to perform optional/opt-in decentralized moderation. Git version."
arch=('any')
url="https://github.com/majestrate/nntpchan"
license=('unknown')
depends=('srndv2-git')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=nntpchan.install
source=("${_pkgname}::git+https://github.com/majestrate/nntpchan")
md5sums=('SKIP')

pkgver()
{
	cd $_pkgname
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package()
{
	install -m755 -d "${pkgdir}/srv/${_pkgname}"
	cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/srv"
	cp "../bootstrap.sh" "${pkgdir}/srv/${_pkgname}/bootstrap.sh"
}
