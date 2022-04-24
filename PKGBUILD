# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Interactive REPL for executable-based software toolchains'
pkgname=reple
pkgver=0.1.0.2
pkgrel=1
arch=(any)
license=(custom:BSD)
makedepends=(python-pip)
depends=(python-pygments python-prompt_toolkit)
url=https://github.com/BenBrock/reple
source=("https://files.pythonhosted.org/packages/07/fc/579c3853db5ce2676ed198328d417cac18a2cd70dec2ef8accca37d88778/${pkgname}-${pkgver}-py3-none-any.whl"
        https://github.com/BenBrock/reple/raw/cf704a1424dc8c79f70586ed90388f3fbe2be24a/LICENSE)
noextract=("${pkgname}-${pkgver}-py3-none-any.whl")
b2sums=('0324875e2f5ac561ebd531dec4b427ef3b536a2c0adb044583bb8204bb4a2d68ab97173e4bf8afd6665d8af335f1c38d93ca0fe0b207931bf23c82c1bab56054'
        '26e255de7269614724afe5417c6019dca78140dbbcd7ebfced7607e0ea163b60e8839710bc795a193e70ad73067643714e310a48b764f4eaca89ae1bcc256310')

build () {
	msg 'Nothing to build'
}

package () {
	pip install --no-deps --root "${pkgdir}" --compile \
		"${pkgname}-${pkgver}-py3-none-any.whl"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
