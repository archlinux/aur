# Maintainer: afterSt0rm <ateles.1@gmail.com>
 
pkgname=irpf
pkgver=2022.1.4
pkgrel=3
license=('custom')
arch=(any)
pkgdesc='Programa Gerador de Declaração (PGD) da Declaração do Imposto sobre a Renda das Pessoas Físicas (DIRPF)'
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/dirpf'
depends=('java-runtime=11' 'hicolor-icon-theme' 'sh')
install=$pkgname.install
source=(https://downloadirpf.receita.fazenda.gov.br/irpf/2022/irpf/arquivos/IRPF2022-1.4.zip
	Copyright
	$pkgname.png
	$pkgname.desktop
	$pkgname)
sha256sums=('ac16918a9ad90268610b6cfdf4ac1c7ec65a7030f52dfce81a3fba4ddccfceda'
         'abd34d009d96ec93b802f4215395bb317349867a3f4420bf398fc8ba8d9a71a7'
         '541a33893db3730e4d858d5656de055b957801ad958f827b6cd30f308f663684'
         'da9f03823c2e4e444969fdf8937b003ca6f8cb1d81e176348870fd446d3afdfd'
         '3294115bcbaa3eac02826a0965f7646a940df4eab880a4c4d88c907c857df957')

package() {
	cd "$srcdir"/IRPF2022

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
