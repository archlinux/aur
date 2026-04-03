# Maintainer: David Cohen <dacohen@pm.me>
pkgname=ollama-openrc
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRC init script for Ollama on Artix Linux"
arch=('any')
url="https://aur.archlinux.org/packages/ollama-openrc"
license=('MIT')
depends=('openrc' 'ollama')
optdepends=('ollama-cuda: CUDA GPU support'
            'ollama-rocm: ROCm GPU support')
provides=('ollama-openrc')
conflicts=('ollama-openrc')
backup=('etc/conf.d/ollama')
source=('ollama.initd'
        'ollama.confd')
sha256sums=('84a707c85172d50e9dd8a9e26b3994ea74594d7ba52a0592876160aafba61c37'
            'ea2ff4e115b24c7c92767a79f1df9ec7a5e7df2e0b5667293112912096433f38')
	
package() {
	# Install init script
	install -Dm755 "${srcdir}/ollama.initd" "${pkgdir}/etc/init.d/ollama"

	# Install conf.d file
	install -Dm644 "${srcdir}/ollama.confd" "${pkgdir}/etc/conf.d/ollama"

	install -dm755 "${pkgdir}/var/lib/ollama"
}
