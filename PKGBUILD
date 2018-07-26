# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>

pkgname="tsuru"
pkgver=1.5.1
pkgrel=2
pkgdesc="Tsuru client"
arch=('x86_64')
license=('Copyright (c) 2015, tsuru-client authors')

url="https://github.com/tsuru/tsuru-client"

source=("https://github.com/tsuru/tsuru-client/releases/download/${pkgver}/tsuru_${pkgver}_linux_amd64.tar.gz" 
	"LICENSE")

package(){
	cd "${srcdir}"

	tar -xzf "${pkgname}_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

	
	install -Dm755 "${srcdir}/tsuru" "${pkgdir}/usr/bin/tsuru"

	# License
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


	# bash completion
	mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
	install -m644 "$srcdir"/misc/bash-completion "$pkgdir"/usr/share/bash-completion/completions/tsuru


}

sha256sums=('fa3a330c23e4389df95e05b5fd8ed822640cde76560ae4cf3546793a2d9aa58c'
            '047e4f042a8441f2b58bc4181a1d167bc462870f511b3b82f71d9ef3104c1a3e')
