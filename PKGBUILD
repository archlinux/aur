# vim: set noet:
# Maintainer: Score_Under <seejay.11@gmail.com>
pkgname=hydrus-docs-dummy
pkgver=1
pkgrel=1
pkgdesc="Dummy documentation for hydrus (redirects to online docs)"
arch=(any)
url="https://hydrusnetwork.github.io/hydrus/"
license=("Unlicense")
provides=("hydrus-docs=1:0")
conflicts=("hydrus-docs")
source=("no_docs.html")
sha256sums=('ad5ae39dccc4a5683217c83e3ef129821f44c5389f51fe88a9f70f2e2b3bfd01')

package() {
	install -Dm644 no_docs.html "$pkgdir/opt/hydrus/help/no_docs.html"
	for docs_entrypoint in \
		adding_new_downloaders.html changelog.html database_migration.html \
		downloader_gugs.html downloader_login.html \
		downloader_parsers_content_parsers.html \
		downloader_parsers_formulae.html downloader_parsers_page_parsers.html \
		downloader_sharing.html downloader_url_classes.html duplicates.html \
		getting_started_subscriptions.html index.html
	do
		ln -s no_docs.html "$pkgdir/opt/hydrus/help/$docs_entrypoint"
	done
}
