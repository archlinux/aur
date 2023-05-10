# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

pkgbase='python-prefect'
pkgname=('python-prefect')
pkgver=2.10.8
pkgrel=2
pkgdesc='Workflow orchestration and management.'
arch=('any')
url='https://www.prefect.io/'
license=('Apache')
source=("https://files.pythonhosted.org/packages/source/p/prefect/prefect-$pkgver.tar.gz")
sha256sums=('c82f07d32580ef9c274ddde36d50c48453c35494c17e94857d96f8bac88292c8')
provides=("python-prefect=$pkgver")

build() {
  cd "${srcdir}"/prefect-$pkgver
  python setup.py build
} 

package_python-prefect() {
  depends=(
         'python>=3.7.0'
         'python-aiosqlite>=0.17.0'
         'python-alembic>=1.7.5'
         'python-anyio>=3.4.0'
         'apprise>=1.1.0'
	       'python-asgi-lifespan>=1.0'
         'python-asyncpg>=0.23'
         'python-click>=8.0,<8.2'
         'python-cloudpickle>=2.0'
         'python-coolname>=1.0.4'
         'python-croniter>=1.0.12'
         'python-cryptography>=36.0.1'
         'python-dateparser>=1.1.1'
         'python-docker>=4.0'
         'python-fastapi>=0.93'
         'python-fsspec>=2022.5.0'
         'python-griffe>=0.20.0'
         'python-httpx>=0.23,!=0.23.2'
         'python-importlib-metadata>=4.4'
         'python-jinja>=3.0.0'
         'python-jsonpatch>=1.32'
         'python-jsonschema>=3.2.0,<5.0.0'
         'python-kubernetes>=24.2.0'
         'python-orjson>=3.7'
         'python-packaging>=21.3'
         'python-pathspec>=0.8.0'
         'python-pendulum>=2.1.2'
         'python-pydantic>=1.10.0'
         'python-slugify>=5.0'
         'python-pytz>=2021.1'
         'python-pyyaml>=5.4.1'
         'python-readchar>=4.0.0'
         'python-rich>=11.0'
         'python-sqlalchemy>=1.4.22,!=1.4.33,<2.0'
         'python-toml>=0.10.0'
         'python-typer>=0.4.2'
         'python-typing_extensions>=4.1.0'
         'uvicorn>=0.14.0'
         'python-websockets>=10.4'
         )

  cd "${srcdir}"/prefect-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}