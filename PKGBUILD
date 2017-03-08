# Maintainer: Juan Perez gatitofeliz at protonmail at com

pkgname=audacity-extras
pkgver=2.0.01
pkgrel=5
pkgdesc="All nyquist plugins for audacity"
arch=('any')
depends=('audacity')
url="localhost:43110"
license=('GPL2')
source=(
	"https://u.teknik.io/MmbQV.zip"
	"https://u.teknik.io/kU6Nf.zip"
	"https://u.teknik.io/BCXoj.zip"
)

sha384sums=(
	'3267bb20628bbb69aaca2399687f7ce2902486d240cf06a93fe90dbe5c5df24d0b407aafc0d316c45bbb57254c251da6'
	'4eb9186b80f4e94be63397076e36845daa414f3f2b950dca686715aa5ee900329c3c06245e1a1afb6f93cdac21888f57'
	'c72aaca9368d1a7a9a9a3dc87fdc9c514e175b5aafc23444cb774afaad2ab35cb53d7160606c2b897ec4ae6c6509c8ea')

sha512sums=(
	'aee7f211712365c9db0e2589543ca8b04ecf64384a08fecdf30c147c52774dc0c53ef8bd8f3bd51c146bce0ea889c96785cd76619665a084105efbd7ce2898a8'
	'427745713cf88918f4aa85ce99086af7820c86b0d187ebb1bbdc5faaae96aacc8887e3a7fd4ac5737421a69febd9eb9b58750e7132533e3f9c24ecf0a4a3de99'
	'c09d9fb7bc7cc260bbd452ec84579db353872365751a7c8ab80b2914bf312011ce8df3126597cc4a965fc87f2899ec833cef59e3c8d1b6f6bffb2873f0621996')


package() {
	cd "${srcdir}"
	rm notch.ny
	msg2 adding effect plugins
	msg2 adding generate plugins
	msg2 adding analyze plugins

	mkdir -p "${pkgdir}/usr/share/audacity/plug-ins"
	for file in ${srcdir}/*.ny
	do
		install -D -m644 "${file}" "${pkgdir}/usr/share/audacity/plug-ins/"
	done
	}
