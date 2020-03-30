# Maintainer: goll <adrian.goll+aur[at]gmail>
# Maintainer: Michael Lass <bevan@bi-co.net>

pkgname=sslyze
pkgver=3.0.0
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('AGPL3')
depends=('python' 'python-typing_extensions')
makedepends=('python-pip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz"
        "sslyze")
sha256sums=('91fc6a72248ff8093c7b05177c4f4c7a9435d05781a6fe58fa33fec7470e813e'
            '042db33726a889a64910121f2098e10e6a5ebf4a102a54d09d9a27ed363a8e5d')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	# Install files in /opt
	install -dm755 "$pkgdir/opt/sslyze"
	/usr/bin/pip install . --target "$pkgdir/opt/sslyze/"

	# Create an indirect launcher in /usr/bin
	install -Dm755 "$srcdir/sslyze" "$pkgdir/usr/bin/sslyze"
}
