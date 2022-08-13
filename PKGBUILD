# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gofile-downloader-git
pkgver=r17.41119d8
pkgrel=1
pkgdesc='Download files from https://gofile.io'
arch=(any)
url=https://github.com/ltsdw/gofile-downloader
license=(GPL3)
depends=(python python-certifi python-charset-normalizer python-idna python-requests python-urllib3)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "${pkgname%-git}/${pkgname%-git}.py" "${pkgdir}/usr/bin/${pkgname%-git}"
}
