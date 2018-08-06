# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=hashid
pkgver=v3.1.4+16+7e8473
pkgrel=1
_githash=7e8473a823060e56d4b6090a98591e252bd9505e
pkgdesc="Identify the different types of hashes used to encrypt data and especially passwords"
arch=("any")
url="https://github.com/psypanda/hashID"
license=("GPL3")
depends=("python>=3.3")
source=("https://raw.githubusercontent.com/psypanda/hashID/${_githash}/hashid.py" "https://raw.githubusercontent.com/psypanda/hashID/${_githash}/doc/man/hashid.7")
sha512sums=("1c7c1834e9a8ae45daa4266ef44697bd09ffe85edc8e77694513dbc6e9640e2195b9ca8433d3e73f3a6fdbb96158d58dfd6f0e1a109c19c38017a57874abb6ab" "f8dee5ac2db86eb0ef0b142602183fd4f60b2cd68ac062563be21b090f52fc36a193d98df6d34fac6d51a141cc60d9d1b5406ce6a06f6e1864693a018aa7d2b7")

prepare() {
	gzip --force hashid.7
}

package() {
	install -Dm 755 hashid.py "${pkgdir}/usr/bin/hashid"
	install -g 0 -o 0 -Dm 0644 hashid.7.gz "${pkgdir}/usr/share/man/man7/hashid.7.gz"
}
