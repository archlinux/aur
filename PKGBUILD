pkgname='python-wordpress-rss-archiver'
_module='wordpress-rss-archiver'
_src_folder='wordpress_rss_archiver-0.1.1'
pkgver='0.1.1'
pkgrel=1
pkgdesc="WordPress.com/Automattic.com charges you US$38,000 to host your blog for 100 years and automatically submit your site to the Internet Archive? Well, We can do it for free... (the latter part at least, lol)"
url="https://github.com/saveweb/wordpress-rss-archiver"
depends=('python' 'python-requests' 'python-feedparser')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('None')
arch=('any')
source=("https://files.pythonhosted.org/packages/ea/6a/165b65bd6aead6f829033ef1af0d53809c828a564d8e720b8b8ecaed5240/wordpress_rss_archiver-0.1.1.tar.gz")
sha256sums=('2441973cb024ca139a357fc7b55cc294006ceff29ae30eda4e5d4a28065b5561')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
