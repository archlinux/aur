# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: EndstoneMC <hello@endstone.dev>
pkgname=python-endstone
_pkgname=endstone
pkgver=0.10.11
pkgrel=1
pkgdesc="High-level Plugin API for Bedrock Dedicated Servers (BDS), in both Python and C++."
arch=('x86_64')
url="https://github.com/EndstoneMC/endstone"
license=('Apache-2.0')
depends=('python-click' 'python-importlib_resources' 'python-certifi' 'python-charset-normalizer' 'python-pyaml' 'python-rich' 'python-idna' 'python-zipp' 'python-tomlkit' 'python-urllib3' 'python-psutil' 'python-pygments' 'python-requests' 'python-typing_extensions' 'python-importlib-metadata' 'python-mdurl' 'python-markdown-it-py' 'python-numpy' 'python-pkginfo' 'python-packaging' 'python-schedule' 'python-sentry_crashpad' 'python-endstone_bstats')
makedepends=('python' 'python-pip')
build() {
    pip install --no-deps --target="endstone" endstone==0.10.11
}
package() {
    sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
    mkdir -p ${pkgdir}/${sitepackages}
    cp -r ${srcdir}/endstone/* ${pkgdir}/${sitepackages}
}
