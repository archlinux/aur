# Maintainer: Márcio Sousa Rocha <marciosr10@gmail.com>
# Baseado no PKGBUILD feito por Lara Maia <lara@craft.net.br>
 
pkgname=irpf
pkgver=2021.1.1
pkgrel=1
license=('custom')
 
arch=(any)
pkgdesc='Programa Oficial da Receita para elaboração do IRPF'
url='http://www.receita.fazenda.gov.br'
 

source=(https://downloadirpf.receita.fazenda.gov.br/irpf/2021/irpf/arquivos/IRPF2021-1.1.zip
	Copyright
	$pkgname.png
	$pkgname.desktop
	$pkgname.install
	$pkgname)
 
md5sums=('67320c8ad6df804e73a292ee093f5e61'
         '0b81ed3a0a6200d2706caf541756d55d'
         '43d8c9617118578f03b2c4eeb1c72c57'
         '5c3f364ed6e30e8aac69ad4394deabba'
         'd9ac8023f52d57323acef3aecbe2458b'
         'a3343e87932f90696d08d0bd015ea89b')
 #java-environment
depends=('java-environment' 'hicolor-icon-theme' 'desktop-file-utils')
install=$pkgname.install
 
 
package() {
	cd "$srcdir"/IRPF2021

	mkdir -p "$pkgdir"/usr/share/{icons/hicolor/128x128/apps,applications,licenses/irpf,irpf}
	mkdir "$pkgdir"/usr/bin
       

	cp -rf lib "$pkgdir"/usr/share/irpf/
	cp -rf lib-modulos "$pkgdir"/usr/share/irpf/
	cp -rf help "$pkgdir"/usr/share/irpf/
      
	install -Dm755 irpf.jar "$pkgdir"/usr/share/irpf/

	install -Dm644 Leia-me.htm "$pkgdir"/usr/share/irpf/
	install -Dm644 offline.png "$pkgdir"/usr/share/irpf/
	install -Dm644 online.png "$pkgdir"/usr/share/irpf/
	install -Dm644 pgd-updater.jar "$pkgdir"/usr/share/irpf/

	install -Dm755 "$srcdir"/irpf "$pkgdir"/usr/bin/
       
	install -Dm644 "$srcdir"/Copyright "$pkgdir"/usr/share/licenses/irpf/
       
	install -Dm644 "$srcdir"/irpf.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/
	install -Dm644 "$srcdir"/irpf.desktop "$pkgdir"/usr/share/applications/
}
