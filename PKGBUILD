# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=svetovid-lib-bin
_name=svetovid-lib
pkgver=0.5.1
_ghver=0.5.1
pkgrel=1
pkgdesc='Supplement Library for Introductory Programming Courses'
arch=(any)
url=https://github.com/ivanpribela/svetovid-lib
license=(APACHE)
depends=(java-runtime)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/ivanpribela/$_name/releases/download/v$_ghver/$_name.jar"
        "https://github.com/ivanpribela/$_name/blob/v$_ghver/LICENSE"
				"https://github.com/ivanpribela/$_name/blob/v$_ghver/NOTICE")
noextract=('svetovid-lib.jar')
sha512sums=('9ec52334e4b1484333603f1d35efdc3242a13b826c8114459e810fb44c4da9243bc4ef82e666132f6a4009e735443edb5e8b6f9ab79f123e90407725f09b9548'
            '54825fc8c8753230686c8076327f14ef401d49994f8f9d014c62c864bacdc055247029599a6908dc6d200ee0a36c09fb1c325d0ea92390d48d0ebe4a86ef959f'
            'ef149d49d4c0820abf608faab4f0089736dd364b5a1a99e5c8bdb3723cf8a3fcbb787c7f9dcaf0174cee68977be6a66a0c686b52c318e1eebb464a8d1eb08e8f')

package() {
	cd "${srcdir}"

	install -Dm644 "$_name.jar" -t "$pkgdir/usr/share/java"

	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "NOTICE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
