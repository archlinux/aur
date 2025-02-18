# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=testcontainers
pkgname=python-${_name}
pkgver=4.9.1
pkgrel=1
pkgdesc='Python library for throwaway instances of anything that can run in a Docker container.'
arch=('any')
url='https://github.com/testcontainers/testcontainers-python'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('37fe9a222549ddb788463935965b16f91809e9a8d654f437d6a59eac9b77f76f')
depends=('python>=3.9' 'python-docker' 'python-urllib3' 'python-wrapt' 'python-typing_extensions' 'python-dotenv')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('python-arango: arangodb'
            'python-botto3: aws/localstack'
            'python-httpx: aws/generic/test_module_import'
            'python-azure-storage-blob: azurite'
            'python-clickhouse-driver: clickhouse'
            'python-azure-cosmos: cosmosdb'
            'python-sqlalchemy: db2/mssql/mysql/oracle/oracle-free'
            'python-ibm-db-sa: db2'
            'python-redis: generic/redis'
            'python-google-cloud-pubsub: google'
            'python-google-cloud-datastore: google'
            'python-influxdb: influxdb'
            'python-influxdb-client: influxdb'
            'python-kubernetes: k3s'
            'python-pyyaml: k3s'
            'python-keycloak: keycloak'
            'python-cryptography: mailpit/sftp'
            'python-minio: minio'
            'python-pymongo: mongodb'
            'python-pymssql: mssql'
            'python-pymysql: mysql'
            'python-nats: nats'
            'python-neo4j: neo4j'
            'python-opensearch: opensearch'
            'python-oracledb: oracle/oracle-free'
            'python-qdrant-client: qdrant'
            'python-pika: pika'
            'python-bcrypt: registry'
            'python-selenium: selenium'
            'python-cassandra-driver: scylla'
            'python-weaviate-client: weaviate'
            'python-chromadb-client: chroma'
            'python-trino: trino')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
